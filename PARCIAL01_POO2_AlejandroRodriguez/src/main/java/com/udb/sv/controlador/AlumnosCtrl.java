/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.udb.sv.controlador;

import com.udb.sv.modelo.Alumnos;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.persistence.TypedQuery;

/**
 *
 * @author Laboratorio
 */
public class AlumnosCtrl {
    
    public boolean guar(Alumnos obje)
    {
        boolean resp = false;
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("POOPU");
        EntityManager em = emf.createEntityManager();
        EntityTransaction tx = em.getTransaction();
        tx.begin();
        try
        {
            em.persist(obje);
            tx.commit();
            resp = true;
        }
        catch(Exception ex)
        {
            tx.rollback();
        }
        em.close();
        emf.close();
        return resp;
    }
    
    public Alumnos get(Integer empId)
    {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("POOPU");
        EntityManager em = emf.createEntityManager();
        Alumnos resp = null;
        
        try{
            resp = em.find(Alumnos.class, empId);
            
        }catch(Exception e){
            e.printStackTrace();
        }
        em.close();
        emf.close();
        return resp;
    }
    
    public List<Alumnos>  ConsTodo()
    {
        List<Alumnos> resp = new ArrayList<>();
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("POOPU");
        EntityManager em = emf.createEntityManager();
        try
        {
          TypedQuery<Alumnos> query =em.createNamedQuery("Alumnos.findAll", Alumnos.class);
           resp = query.getResultList();
        }
        catch(Exception ex)
        {
            
        }
        em.close();
        emf.close();
        return resp;
    }
}
