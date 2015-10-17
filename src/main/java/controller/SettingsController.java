package controller;

import domain.Address;
import domain.Customer;
import javax.validation.Valid;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import service.CustomerDao;

/**
 *
 * @author Bjorn
 */
@Controller
public class SettingsController {
    
    @Autowired
    private CustomerDao customerRepository;

    private Customer customer;
    
    
    @RequestMapping(value="/personalSettings",method=RequestMethod.GET)
    public String changePersonalSettings(@ModelAttribute("address") Address address, Model model) {
        //get user from context
        User principal = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        long customerId = Integer.parseInt(principal.getUsername());
        customer = customerRepository.get(customerId);
        if(!model.containsAttribute("error"))
            model.addAttribute("address",customer.getAddress());
        return "personalSettings";
    }
    
    @RequestMapping(value="/savePersonalSettings",method=RequestMethod.POST)
    public String savePersonalSettings(RedirectAttributes redirectAttributes,@Valid @ModelAttribute("address") Address address, BindingResult result, Model model)
    {
        if(result.hasErrors()) {
            redirectAttributes.addFlashAttribute("error","error");
            redirectAttributes.addFlashAttribute("address",address);
            return "redirect:/personalSettings.htm";
        }
        User principal = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        long customerId = Integer.parseInt(principal.getUsername());
        this.customer = customerRepository.getCustomer(customerId);
        customerRepository.saveAddress(customer, address);
        redirectAttributes.addFlashAttribute("success","Successful save");
        return "redirect:/personalSettings.htm";
    }
    
}
