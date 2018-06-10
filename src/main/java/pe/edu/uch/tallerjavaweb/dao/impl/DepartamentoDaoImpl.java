package pe.edu.uch.tallerjavaweb.dao.impl;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;

import pe.edu.uch.tallerjavaweb.dao.DepartamentoDao;
import pe.edu.uch.tallerjavaweb.entidad.Departamento;

public class DepartamentoDaoImpl implements DepartamentoDao, Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 7593293074272728536L;
	
	@Autowired
    private SessionFactory sessionFactory;
	
	private Session sessionObj;
    
	@Override
	public List<Departamento> buscar() {
		// TODO Auto-generated method stub
		List<Departamento> lstDepartamento;		
        try {
            sessionObj =  sessionFactory.openSession();
            sessionObj.beginTransaction();

            lstDepartamento = sessionObj.createQuery("FROM departamento").list();
            
        } catch (HibernateException sqlException) {
        	lstDepartamento = new ArrayList<>();
            if (null != sessionObj.getTransaction()) {
                sessionObj.getTransaction().rollback();
            }
            System.err.println(sqlException.getMessage());
        } finally {
            if (sessionObj != null) {
                sessionObj.close();
            }
        }
        return lstDepartamento; 
	}

	@Override
	public boolean guardar(Departamento departamento) {
		// TODO Auto-generated method stub
		boolean respuesta = false;
		try {
			sessionObj =  sessionFactory.openSession();
            sessionObj.beginTransaction();

            sessionObj.save(departamento);

            sessionObj.getTransaction().commit();
            respuesta = true;
            
        } catch (HibernateException sqlException) {
            if (null != sessionObj.getTransaction()) {
                sessionObj.getTransaction().rollback();
            }
            System.err.println(sqlException.getMessage());
        } finally {
            if (sessionObj != null) {
                sessionObj.close();
            }
        }
		return respuesta;
	}

	@Override
	public boolean eliminar(Departamento departamento) {
		// TODO Auto-generated method stub
		boolean respuesta = false;
		try {
			sessionObj =  sessionFactory.openSession();
            sessionObj.beginTransaction();

            sessionObj.delete(departamento);

            sessionObj.getTransaction().commit();
            respuesta = true;
            
        } catch (HibernateException sqlException) {
            if (null != sessionObj.getTransaction()) {
                sessionObj.getTransaction().rollback();
            }
            System.err.println(sqlException.getMessage());
        } finally {
            if (sessionObj != null) {
                sessionObj.close();
            }
        }
		return respuesta;
	}

	@Override
	public boolean actualizar(Departamento departamento) {
		// TODO Auto-generated method stub
		boolean respuesta = false;
		try {
			sessionObj =  sessionFactory.openSession();
            sessionObj.beginTransaction();

            sessionObj.update(departamento);

            sessionObj.getTransaction().commit();
            respuesta = true;
            
        } catch (HibernateException sqlException) {
            if (null != sessionObj.getTransaction()) {
                sessionObj.getTransaction().rollback();
            }
            System.err.println(sqlException.getMessage());
        } finally {
            if (sessionObj != null) {
                sessionObj.close();
            }
        }
		return respuesta;
	}

	@Override
	public Departamento buscarPorId(int id) {
		// TODO Auto-generated method stub
		Departamento departamento = null;
        try {
        	sessionObj =  sessionFactory.openSession();
            sessionObj.beginTransaction();

            departamento = (Departamento) sessionObj.load(Departamento.class, id);
            
            
        } catch (HibernateException sqlException) {
            if (null != sessionObj.getTransaction()) {
                System.out.println("\n.......Transaction Is Being Rolled Back.......\n");
                sessionObj.getTransaction().rollback();
            }
            System.err.println(sqlException.getMessage());
        }
        return departamento;
	}

}
