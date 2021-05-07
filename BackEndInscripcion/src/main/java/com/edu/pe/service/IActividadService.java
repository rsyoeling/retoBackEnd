package com.edu.pe.service;

import com.edu.pe.models.Actividad;
import java.util.List;

public interface IActividadService {

    public List<Actividad> ListarTodos();

    public boolean Registrar(Actividad a);
}
