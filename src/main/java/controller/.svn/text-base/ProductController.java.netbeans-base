package controller;

import domain.Customer;
import domain.LoyaltyCard;
import domain.ProductPacking;
import domain.ProductSavingsCard;
import domain.ShoppingList;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
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
import service.LoyaltyCardDao;
import service.ProductPackingDao;

@Controller
public class ProductController
{
    @Autowired
    private ProductPackingDao productRepository;
    
    @Autowired
    private LoyaltyCardDao loyaltyCardRepository;
    
    @Autowired
    private CustomerDao customerRepository;
    
    private List<LoyaltyCard> loyaltyCards;
    private List<ProductPacking> foundProductsByCategory;
    private Customer customer;
    
    @RequestMapping(value = "/ProductDetail/{id}", method = RequestMethod.GET)
    public String productDetailFromShoppingList(@PathVariable("id") int productId, Model model) 
    {
          if(customer == null) {
            User principal = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
            customer = customerRepository.getCustomer(Integer.parseInt(principal.getUsername()));
        }
        
        ProductPacking p = productRepository.getProduct(productId);
        //Normale remove werkte niet...
        foundProductsByCategory = productRepository.getProductsByCategoryId(p.getCategory().getCategoryId());
        for(ProductPacking pp : foundProductsByCategory) {
            if(pp.getPackingId()==p.getPackingId()) {
                int index = foundProductsByCategory.indexOf(pp);
                foundProductsByCategory.remove(index);
                break;
            }
        }
        
        loyaltyCards = loyaltyCardRepository.getLoyaltyCards(customer);
        List<ProductSavingsCard> productSavingsCards = new ArrayList<>();
        for(LoyaltyCard lc:loyaltyCards){
            if(lc instanceof ProductSavingsCard) {
                ProductSavingsCard psc=(ProductSavingsCard) lc;
                if(psc.getProduct().getProductId()==p.getProductId())
                    productSavingsCards.add(psc);
            }
        }
        model.addAttribute("loyaltyCards",productSavingsCards);
        model.addAttribute("Product", p);
        model.addAttribute("foundProductsByCategory",foundProductsByCategory);
        return "productDetail";
    }
}
