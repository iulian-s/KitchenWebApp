package com.exemplu.dao;

import java.time.LocalDate;
import java.util.List;

public class Reteta {
	private int id;
	private String titlu;
	private String instructiuni;
	private String ingrediente;
	private int idUtilizator;
	private LocalDate dataAdaugarii;
    private List<ContinutReteta> lista_ingrediente;
	public Reteta(int id, String titlu, String instructiuni, String ingrediente) {
		super();
		this.id = id;
		this.titlu = titlu;
		this.instructiuni = instructiuni;
		this.ingrediente = ingrediente;
	}
	
	public Reteta(String titlu, String instructiuni, int idUtilizator, LocalDate dataAdaugarii) {
        this.titlu = titlu;
        this.instructiuni = instructiuni;
        this.idUtilizator = idUtilizator;
        this.dataAdaugarii = dataAdaugarii;
    }
	
	public int getId() {
		return id;
	}
	public String getTitlu() {
		return titlu;
	}
	public String getInstructiuni() {
		return instructiuni;
	}
	public String getIngrediente() {
		return ingrediente;
	}

	public int getIdUtilizator() {
		return idUtilizator;
	}

	public LocalDate getDataAdaugarii() {
		return dataAdaugarii;
	}

	public List<ContinutReteta> getLista_ingrediente() {
		return lista_ingrediente;
	}
	
	

	
	
	
	
}
