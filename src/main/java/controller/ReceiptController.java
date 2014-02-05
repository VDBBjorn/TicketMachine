package controller;

import domain.Customer;
import domain.Receipt;
import domain.ReceiptManager;
import java.util.List;
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
 * @author Bjorn
 */
@Controller
public class ReceiptController {
    
    @Autowired
    private CustomerDao customerRepository;
    @Autowired
    private ReceiptDao receiptRepository;
    
    private Customer customer;
    List<Receipt> receipts;
    private final static int NUMBEROFRECEIPTS=12;
    private String period;
    
    @RequestMapping(value="/receipts/last", method=RequestMethod.GET)
    public String getFirstReceipts(Model model)
    {
        //get user from context
        User principal = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        customer = customerRepository.getCustomer(Integer.parseInt(principal.getUsername()));
        //get receipts from user from repository
        ReceiptManager rm = new ReceiptManager(receiptRepository.getReceipts(customer));
        receipts = rm.getLastReceipts(NUMBEROFRECEIPTS);
        period="last";
        //add receipts to view
        return "redirect:/receipts.htm";
    }
    
    @RequestMapping(value="/receipts/all", method=RequestMethod.GET)
    public String getAllReceipts(Model model)
    {
        User principal = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        customer = customerRepository.getCustomer(Integer.parseInt(principal.getUsername()));
        ReceiptManager rm = new ReceiptManager(receiptRepository.getReceipts(customer));
        receipts = rm.getAllReceipts();
        period="all";
        return "redirect:/receipts.htm";
    }
    
    @RequestMapping(value="/receipts", method=RequestMethod.GET)
    public String getReceipts(Model model)
    {
        model.addAttribute("receipts",receipts);
        model.addAttribute("period",period);
        return "receipts";
    }
    
    @RequestMapping(value="/receipts/{id}", method=RequestMethod.GET)
    public String getDetailReceipt(@PathVariable("id") Long id, Model model) {
        User principal = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        int customerId = Integer.parseInt(principal.getUsername());
        Receipt receipt = receiptRepository.get(id);
        //check if receipt is allocated to user, so nobody can view other people's receipts
        if((receipt!=null) && (receipt.getCustomer().getCustomerId()==customerId))
        {
            model.addAttribute("receipt", receipt);
            return "receiptDetail";
        }
        else
        {
            return "404";
        }
    }
    
    @RequestMapping(value="/receipts/previous/{id}", method=RequestMethod.GET)
    public String getPreviousReceipt(@PathVariable("id") Long id, Model model) {
        User principal = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        customer = customerRepository.getCustomer(Integer.parseInt(principal.getUsername()));
        ReceiptManager rm = new ReceiptManager(receiptRepository.getReceipts(customer));
        Long receiptId=rm.getPreviousReceiptId(id); 
        String link="redirect:/receipts/"+receiptId+".htm";
        return link;
    }
    
    @RequestMapping(value="/receipts/next/{id}", method=RequestMethod.GET)
    public String getNextReceipt(@PathVariable("id") Long id, Model model) {
        User principal = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        customer = customerRepository.getCustomer(Integer.parseInt(principal.getUsername()));
        ReceiptManager rm = new ReceiptManager(receiptRepository.getReceipts(customer));
        Long receiptId=rm.getNextReceiptId(id); 
        String link="redirect:/receipts/"+receiptId+".htm";
        return link;
    }
}
