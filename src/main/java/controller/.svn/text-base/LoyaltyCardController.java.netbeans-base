package controller;

import domain.Customer;
import domain.LoyaltyCard;
import domain.LoyaltyCardManager;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import service.CustomerDao;
import service.LoyaltyCardDao;

@Controller
public class LoyaltyCardController {

    @Autowired
    private CustomerDao customerRepository;

    @Autowired
    private LoyaltyCardDao loyaltyCardRepository;

    private Customer customer;
    private List<LoyaltyCard> cards;
    private Map<String, List<LoyaltyCard>> cardsByType;

    @RequestMapping(value = "/loyaltyCard", method = RequestMethod.GET)
    public String getLoyaltyCards(Model model) {
        //get user from context
        User principal = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        customer = customerRepository.getCustomer(Integer.parseInt(principal.getUsername()));
        //get cards from user from repository
        LoyaltyCardManager cm = new LoyaltyCardManager(loyaltyCardRepository.getLoyaltyCards(customer));
        cardsByType = cm.getAllLoyaltyCardsByType(); 
        model.addAttribute("cardsByType", cardsByType);
        return "loyaltyCard";
    }
    
    @RequestMapping(value="/loyaltyCard/{id}", method=RequestMethod.GET)
    public String getDetailLoyaltyCard(@PathVariable("id") Long id, Model model) {
        User principal = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        int customerId = Integer.parseInt(principal.getUsername());
        LoyaltyCard card = loyaltyCardRepository.get(id);

        if((card!=null) && (card.getCustomer().getCustomerId()==customerId))
        {
            model.addAttribute("loyaltycard", card);
            return "loyaltyCardDetail";
        }
        else
        {
            return "404";
        }
    }
    
    @RequestMapping(value="/loyaltyCard/previous/{id}", method=RequestMethod.GET)
    public String getPreviousLoyaltyCard(@PathVariable("id") Long id, Model model) 
    {
        User principal = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        customer = customerRepository.getCustomer(Integer.parseInt(principal.getUsername()));
        
        LoyaltyCardManager cm = new LoyaltyCardManager(loyaltyCardRepository.getLoyaltyCards(customer));
        long nextId = cm.getPreviousCardId(id);
        if((nextId>=0))
            return "redirect:/loyaltyCard/"+nextId+".htm";
        else
        {
            return "404";
        }
    }
    
    @RequestMapping(value="/loyaltyCard/next/{id}", method=RequestMethod.GET)
    public String getNextLoyaltyCard(@PathVariable("id") Long id, Model model) 
    {
        User principal = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        customer = customerRepository.getCustomer(Integer.parseInt(principal.getUsername()));
        
        LoyaltyCardManager cm = new LoyaltyCardManager(loyaltyCardRepository.getLoyaltyCards(customer));
        long previousId = cm.getNextCardId(id);
        if((previousId>=0))
            return "redirect:/loyaltyCard/"+previousId+".htm";
        else
        {
            return "404";
        }
    }
}
