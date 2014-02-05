/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import domain.Category;
import java.util.List;
import javax.persistence.Query;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Kenneth
 */
@Repository("category")
public class JpaCategoryDao extends GenericDaoJpa<Category> implements CategoryDao  {
    
    public JpaCategoryDao()
    {
        super(Category.class);
    }
    
    @Override
    public List<Category> getAllCategories() {
        Query q = em.createQuery("Select c from Category c");
        return q.getResultList();
    }
    
}
