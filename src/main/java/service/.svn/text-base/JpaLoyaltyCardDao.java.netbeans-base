package service;

import domain.Customer;
import domain.LoyaltyCard;
import java.util.List;
import javax.persistence.Query;
import org.springframework.stereotype.Repository;


@Repository("loyaltyCard")
public class JpaLoyaltyCardDao extends GenericDaoJpa<LoyaltyCard> implements LoyaltyCardDao
{

    public JpaLoyaltyCardDao() {
        super(LoyaltyCard.class);
    }

    @Override
    public List<LoyaltyCard> getLoyaltyCards(Customer customer) 
    {
        Query q = em.createQuery("SELECT c FROM LoyaltyCard c WHERE c.customer = :customer ");
        q.setParameter("customer", customer);
        return q.getResultList();
    }
}
