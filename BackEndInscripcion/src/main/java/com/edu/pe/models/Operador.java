package com.edu.pe.models;

import com.fasterxml.jackson.annotation.JsonFormat;
import java.io.Serializable;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "Operador")
public class Operador implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private int id;

    @ManyToOne
    @JoinColumn(name = "id", insertable = false, updatable = false)
    private Cliente cliente;

    @ManyToOne
    @JoinColumn(name = "id", insertable = false, updatable = false)
    private Actividad actividad;

    private int status;

    @Column(name = "Cod_Generado")
    private String codGenerado;

    @JsonFormat(pattern = "yyyy-MM-dd")
    private Date fecha;
    private String comentarios;

    @Override
    public String toString() {
        return "Operador{" + "id=" + id + ", cliente=" + cliente + ", actividad=" + actividad + ", status=" + status + ", codGenerado=" + codGenerado + ", fecha=" + fecha + ", comentarios=" + comentarios + '}';
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Cliente getCliente() {
        return cliente;
    }

    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
    }

    public Actividad getActividad() {
        return actividad;
    }

    public void setActividad(Actividad actividad) {
        this.actividad = actividad;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public String getComentarios() {
        return comentarios;
    }

    public void setComentarios(String comentarios) {
        this.comentarios = comentarios;
    }

    public String getCodGenerado() {
        return codGenerado;
    }

    public void setCodGenerado(String codGenerado) {
        this.codGenerado = codGenerado;
    }

}
