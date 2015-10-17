package service;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;

@Transactional
public class GenericDaoJpa<T> implements GenericDao<T> {

    private Class<T> type;
    protected EntityManager em;

    public GenericDaoJpa(Class<T> type) {
        super();
        this.type = type;
    }

    @PersistenceContext
    public void setEntityManager(EntityManager em) {
        this.em = em;
    }

    @Transactional(readOnly = true)
    public T get(Long id) {
        try {
            T entity = this.em.find(this.type, id);
            return entity;
        }
        catch (NoResultException e) {
            return null;
        }
        
    }

    @Transactional(readOnly = true)
    public List<T> findAll() {
        try {
            return this.em.createQuery(
                "select entity from " + this.type.getName() + " entity").getResultList();
        } 
        catch (NoResultException e) {
            return null;
        }
    }

    @Transactional
    @Override
    public void insert(T object) {
        em.persist(object);
    }

    @Transactional
    @Override
    public void delete(T object) {
        em.remove(em.merge(object));
    }

    @Transactional(readOnly = true)
    @Override
    public boolean exists(Long id) {
        T entity = this.em.find(this.type, id);
        return entity != null;
    }

    @Override
    public T update(T object) {
        return em.merge(object);
    }
}
