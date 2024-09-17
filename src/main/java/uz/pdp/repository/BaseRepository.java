package uz.pdp.repository;

import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;
import uz.pdp.entity.BaseEntity;

import java.util.UUID;

public abstract class BaseRepository <T extends BaseEntity> {

    protected Class<T> type;

    @PersistenceContext
    protected EntityManager entityManager;

    @Transactional
    public T save(T entity) {
        entityManager.persist(entity);
        return entity;
    }

    public T findById(UUID id) {
        return entityManager.find(type, id);
    }

    @Transactional
    public void delete(UUID id) {
        entityManager.remove(findById(id));
    }

    @Transactional
    public void update(T entity) {
        entityManager.merge(entity);
    }


}
