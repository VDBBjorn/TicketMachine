/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import domain.Address;
import domain.Store;
import java.util.List;
import java.util.Properties;
import javax.validation.Valid;
import javax.websocket.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import service.StoreDao;




@Controller
public class ShopLocationsController {
    
    @Autowired
    private StoreDao storeRepository;
    
    private List<Store> stores;
    
    @RequestMapping(value = "/shoplocations", method = RequestMethod.GET)
    public String getNextVoucher(Model model) {
        stores = storeRepository.getStores();
        model.addAttribute("stores", stores);
        return "shoplocations";
    }
    
    @RequestMapping(value = "/succesContact", method = RequestMethod.POST)
    public String showSuccesContact(RedirectAttributes redirectAttributes,@Valid @ModelAttribute("address") Address address, BindingResult result, Model model) {
       
        //email effectief nog versturen
        //toaster
        boolean succesContacted = true;
        
        //
        stores = storeRepository.getStores();
        model.addAttribute("succesContacted", succesContacted);
        model.addAttribute("stores", stores);
        return "shoplocations";
    }
    
}
