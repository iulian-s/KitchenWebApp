package com.exemplu.dao;

import java.time.LocalDate;

public class Aliment {
	private int id;
    private String nume;
    private String categorie;
    private int id_categorii;
    private int id_utilizator_care_a_adaugat;
    private LocalDate data_inserarii;
	public Aliment(int id, String nume, String categorie, int id_categorii, int id_utilizator_care_a_adaugat,
			LocalDate data_inserarii) {
		super();
		this.id = id;
		this.nume = nume;
		this.categorie = categorie;
		this.id_categorii = id_categorii;
		this.id_utilizator_care_a_adaugat = id_utilizator_care_a_adaugat;
		this.data_inserarii = data_inserarii;
	}
	
	public Aliment(int id, String nume) {
		super();
		this.id = id;
		this.nume = nume;
	}

	public int getId() {
		return id;
	}
	public String getNume() {
		return nume;
	}
	public String getCategorie() {
		return categorie;
	}
	public int getId_categorii() {
		return id_categorii;
	}
	public int getId_utilizator_care_a_adaugat() {
		return id_utilizator_care_a_adaugat;
	}
	public LocalDate getData_inserarii() {
		return data_inserarii;
	}
    
	
	
}
