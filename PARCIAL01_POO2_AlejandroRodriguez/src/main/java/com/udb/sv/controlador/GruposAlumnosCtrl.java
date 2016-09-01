/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.udb.sv.controlador;

import com.udb.sv.modelo.Grupos;
import com.udb.sv.modelo.GruposAlumnos;
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
public class GruposAlumnosCtrl {
    
    public boolean guar(GruposAlumnos obje)
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
    
    public List<GruposAlumnos>  ConsTodo()
    {
        List<GruposAlumnos> resp = new ArrayList<>();
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("POOPU");
        EntityManager em = emf.createEntityManager();
        try
        {
          TypedQuery<GruposAlumnos> query =em.createNamedQuery("GruposAlumnos.findAll", GruposAlumnos.class);
           resp = query.getResultList();
        }
        catch(Exception ex)
        {
            
        }
        em.close();
        emf.close();
        return resp;
       
    }
    
    public List<GruposAlumnos> ConsoTodo(Object Codi)
    {
        if(Codi == null){
            Codi = 1;
        }
        List<GruposAlumnos> resp = new ArrayList<>();
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("POOPU");
        EntityManager em = emf.createEntityManager();
        try
        {
            TypedQuery<GruposAlumnos> query =em.createNamedQuery("GruposAlumnos.findByCodiGrup", GruposAlumnos.class);
            query.setParameter("codiGrup",Codi);
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
