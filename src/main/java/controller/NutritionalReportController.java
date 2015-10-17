package controller;

import domain.Category;
import domain.Customer;
import domain.ProductLine;
import domain.ReceiptManager;
import domain.Store;
import java.util.HashMap;
import java.util.List;
import java.util.Set;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import service.CustomerDao;
import service.ReceiptDao;

/**
 *
 * @author Jordy
 */
@Controller
public class NutritionalReportController {
    
    @Autowired
    private CustomerDao customerRepository;
    
    @Autowired
    private ReceiptDao receiptRepository;
    
    private Customer customer;
    private HashMap<Category, List<ProductLine>> productLinesByCategory;
    private HashMap<Category, Double> caloriesPerCategory;
    private HashMap<Category, Double> proteinsPerCategory;
    private HashMap<Category, Double> carbohydratesPerCategory;
    private HashMap<Category, Double> fatPerCategory;
    private Set<Store> stores; 

    @RequestMapping(value="nutritionalReport/{timespan}/{storeName}", method=RequestMethod.GET)
    public String getNutritionalReport(@PathVariable("timespan") String timespan, @PathVariable("storeName") String storeName, Model model)
    {
        //get user from context
        User principal = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        customer = customerRepository.getCustomer(Integer.parseInt(principal.getUsername()));
        //get receipts from user from repository
        ReceiptManager rm = new ReceiptManager(receiptRepository.getReceipts(customer));
        //Respect order below!! First calculate productLinesByCategory, than costsPerCategory!! 
        productLinesByCategory=rm.getExpenseReport(timespan, storeName);
        caloriesPerCategory=rm.getCaloriesPerCategory(timespan);
        proteinsPerCategory=rm.getProteinsPerCategory(timespan);
        carbohydratesPerCategory=rm.getcarbohydratesPerCategory(timespan);
        fatPerCategory=rm.getfatPerCategory(timespan);        
        stores=rm.getStores(); 
        model.addAttribute("productLinesByCategory",productLinesByCategory);      
        model.addAttribute("stores",stores);        
        model.addAttribute("timespan",timespan);
        model.addAttribute("storeName",storeName);
        model.addAttribute("caloriesPerCategory",caloriesPerCategory);
        model.addAttribute("proteinsPerCategory",proteinsPerCategory);
        model.addAttribute("carbohydratesPerCategory",carbohydratesPerCategory);
        model.addAttribute("fatPerCategory",fatPerCategory);
        return "nutritionalReport";
    }
    

}
