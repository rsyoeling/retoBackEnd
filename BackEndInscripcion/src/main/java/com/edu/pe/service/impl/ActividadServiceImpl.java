package com.edu.pe.service.impl;

import com.edu.pe.models.Actividad;
import com.edu.pe.repository.ActividadRepository;
import com.edu.pe.service.IActividadService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ActividadServiceImpl implements IActividadService {

    @Autowired
    private ActividadRepository repositorio;

    @Override
    public List<Actividad> ListarTodos() {
        return repositorio.findAll();
    }

    @Override
    public boolean Registrar(Actividad a) {
        try {
            repositorio.save(a);
            return true;
        } catch (Exception ex) {
            return false;
        }
    }
}
