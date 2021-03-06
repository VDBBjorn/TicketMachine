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
import service.CategoryDao;
import service.CustomerDao;
import service.ReceiptDao;

/**
 *
 * @author Jordy
 */
@Controller
public class ExpenseReportController {

    @Autowired
    private CustomerDao customerRepository;

    @Autowired
    private ReceiptDao receiptRepository;
    
    @Autowired 
    private CategoryDao categoryRepository;

    private Customer customer;
    
    private HashMap<Category, List<ProductLine>> productLinesByCategory;
    private HashMap<Category, Double> costsPerCategory; 
    private Set<Store> stores; 
    
    @RequestMapping(value="/expenseReport/{timespan}/{storeName}", method=RequestMethod.GET)
    public String getExpenseReport(@PathVariable("timespan") String timespan, @PathVariable("storeName") String storeName, Model model)
    {
        //get user from context
        User principal = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        customer = customerRepository.getCustomer(Integer.parseInt(principal.getUsername()));
        //get receipts from user from repository
        ReceiptManager rm = new ReceiptManager(receiptRepository.getReceipts(customer));
        //Respect order below!! First calculate productLinesByCategory, than costsPerCategory!! 
        productLinesByCategory = rm.getExpenseReport(timespan, storeName);
        costsPerCategory = rm.getCostPerCategory();
        stores = rm.getStores();
        model.addAttribute("productLinesByCategory", productLinesByCategory);
        model.addAttribute("costsPerCategory", costsPerCategory);
        model.addAttribute("stores", stores);
        model.addAttribute("timespan", timespan);
        model.addAttribute("storeName", storeName);
        model.addAttribute("categories",categoryRepository.getAllCategories());
        return "expenseReport";
    }
}
