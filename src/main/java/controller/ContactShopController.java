package controller;

import domain.Customer;
import domain.Store;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import service.CustomerDao;
import service.StoreDao;

@Controller
public class ContactShopController {
    
    @Autowired
    private StoreDao storeRepository;
     
    @Autowired
    private CustomerDao customerRepository;
    
    private List<Store> stores;
    
    @RequestMapping(value = "/contact", method = RequestMethod.GET)
    public String contactShop(Model model) {
        stores = storeRepository.getStores();
        model.addAttribute("stores", stores);
        User principal = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        Customer customer = customerRepository.getCustomer(Integer.parseInt(principal.getUsername()));
        model.addAttribute("firstname", customer.getFirstName());
        model.addAttribute("lastname", customer.getLastName());
        return "contactShop";
    }
    
}
