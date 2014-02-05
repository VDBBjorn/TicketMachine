package controller;

import domain.Category;
import domain.CategorySavingsCard;
import domain.Customer;
import domain.LoyaltyCard;
import domain.ProductPacking;
import domain.ProductSavingsCard;
import domain.ShoppingList;
import domain.Store;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import service.CategoryDao;
import service.CustomerDao;
import service.LoyaltyCardDao;
import service.ProductPackingDao;
import service.StoreDao;

/**
 *
 * @author Kenneth
 */
@Controller
public class ShoppingListController {

    @Autowired
    private CustomerDao customerRepository;
    @Autowired
    private ProductPackingDao productRepository;
    @Autowired
    private CategoryDao categoryRepository;
    @Autowired
    private LoyaltyCardDao loyaltyCardRepository;
    @Autowired
    private StoreDao storeRepository;
    private Customer customer;
    private ShoppingList shoppingList;
    private List<ProductPacking> foundProducts;
    private List<ProductPacking> foundProductsByCategory;
    private List<LoyaltyCard> loyaltyCards;
    private List<Category> categories;
    private List<Store> stores;
    private String selectedStore;

    @RequestMapping(value = "/shoppingList", method = RequestMethod.GET)
    public String getShoppingList(Model model) {
        if (customer == null) {
            User principal = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
            customer = customerRepository.getCustomer(Integer.parseInt(principal.getUsername()));
        }
        if (shoppingList == null) {
            if ((shoppingList = customer.getShoppingList()) == null) {
                shoppingList = new ShoppingList();
                customer.setShoppingList(shoppingList);
                customerRepository.update(customer);
            }
        }
        categories = categoryRepository.getAllCategories();
        loyaltyCards = loyaltyCardRepository.getLoyaltyCards(customer);
        List<LoyaltyCard> savingsCards = new ArrayList<>(); 
        for(LoyaltyCard lc:loyaltyCards){
            if(lc instanceof ProductSavingsCard || lc instanceof CategorySavingsCard){
                savingsCards.add(lc);
            }
        }
        if (foundProducts == null) {
            foundProducts = productRepository.getFavoriteProducts(customer);
        }
        stores = storeRepository.getStores();
        //adding to the view
        model.addAttribute("stores", stores);
        model.addAttribute("ShoppingList", shoppingList);
        model.addAttribute("foundProducts", foundProducts);
        model.addAttribute("categories", categories);
        model.addAttribute("loyaltyCards", savingsCards);
        return "shoppingList";
    }

    @RequestMapping(value = "/ShoppingList/CategoryShow/{id}", method = RequestMethod.GET)
    public String showProductsPerCategory(@PathVariable("id") int id, RedirectAttributes redirectAttributes, Model model) {
        foundProducts = productRepository.getProductsByCategoryId(id);
        redirectAttributes.addFlashAttribute("foundProducts", foundProducts);
        return "redirect:/shoppingList.htm";
    }

    @RequestMapping(value = "/ShoppingList/Remove/{id}", method = RequestMethod.GET)
    public String removeProductFromShoppingList(@PathVariable("id") int id, RedirectAttributes redirectAttributes, Model model) {
        if (customer == null) {
            User principal = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
            customer = customerRepository.getCustomer(Integer.parseInt(principal.getUsername()));
        }
        if (shoppingList == null) {
            shoppingList = customer.getShoppingList();
        }
        shoppingList.removeProduct(id);
        customerRepository.update(customer);
        ProductPacking p = productRepository.getProduct(id);
        redirectAttributes.addFlashAttribute("removedProduct",p.getProduct().getName());
        return "redirect:/shoppingList.htm";
    }

    @RequestMapping(value = "/ShoppingList/Search", method = RequestMethod.POST)
    public String searchProductForShoppingList(@RequestParam String searchField, @RequestParam int id, RedirectAttributes redirectAttributes, Model model) {
        foundProducts = productRepository.getProducts(searchField);
        redirectAttributes.addFlashAttribute("foundProducts", foundProducts);
        return "redirect:/shoppingList.htm";
    }

    @RequestMapping(value = "/ShoppingList/Add/{id}", method = RequestMethod.GET)
    public String addProductForShoppingList(@PathVariable("id") int productId, RedirectAttributes redirectAttributes, Model model) {
        if (customer == null) {
            User principal = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
            customer = customerRepository.getCustomer(Integer.parseInt(principal.getUsername()));
        }
        if (shoppingList == null) {
            shoppingList = customer.getShoppingList();
        }
        ProductPacking p = productRepository.getProduct(productId);
        shoppingList.addProduct(p);
        customerRepository.update(customer);
        redirectAttributes.addFlashAttribute("addedProduct",p.getProduct().getName());
        return "redirect:/shoppingList.htm";
    }

    @RequestMapping(value = "/ShoppingList/RemoveAll/", method = RequestMethod.GET)
    public String removeAllProductsFromShoppingList(Model model) {
        if (customer == null) {
            User principal = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
            customer = customerRepository.getCustomer(Integer.parseInt(principal.getUsername()));
        }
        if (shoppingList == null) {
            shoppingList = customer.getShoppingList();
        }
        shoppingList.removeAll();
        customerRepository.update(customer);
        return "redirect:/shoppingList.htm";
    }

    @RequestMapping(value = "searchClick/{searchText}/{storeId}", method = RequestMethod.GET)
    public String searchWithStoreName(@NotEmpty @PathVariable("searchText") String searchText,@PathVariable("storeId") Long id,RedirectAttributes redirectAttributes,Model model ) {
        foundProducts = productRepository.getProductsByStore(id, searchText);        
        selectedStore = storeRepository.get(id).getName();
        redirectAttributes.addFlashAttribute("selectedStore", selectedStore);
        redirectAttributes.addFlashAttribute("foundProducts", foundProducts);
        return "redirect:/shoppingList.htm";

    }
}
