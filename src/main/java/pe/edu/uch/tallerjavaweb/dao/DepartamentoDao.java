package pe.edu.uch.tallerjavaweb.dao;

import java.util.List;

import pe.edu.uch.tallerjavaweb.entidad.Departamento;

public interface DepartamentoDao {
	public List<Departamento> buscar();
	public boolean guardar(Departamento departamento);
	public boolean eliminar(Departamento departamento);
	public boolean actualizar(Departamento departamento);
	public Departamento buscarPorId(int id);
}
