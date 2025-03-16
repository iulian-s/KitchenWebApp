package com.exemplu.dao;

import java.time.LocalDate;

public class AlimenteUser {
	private int id;
	private int id_user;
	private int id_aliment;
	private String nume_aliment;
	private int cantitate;
	private int id_unitate_de_masura;
	private String unitate_de_masura;
	private LocalDate data_expirare;
	private int pret;
	
	public AlimenteUser(int id, int id_user, int id_aliment, String nume_aliment, int cantitate,
			int id_unitate_de_masura, String unitate_de_masura, LocalDate data_expirare, int pret) {
		super();
		this.id = id;
		this.id_user = id_user;
		this.id_aliment = id_aliment;
		this.nume_aliment = nume_aliment;
		this.cantitate = cantitate;
		this.id_unitate_de_masura = id_unitate_de_masura;
		this.unitate_de_masura = unitate_de_masura;
		this.data_expirare = data_expirare;
		this.pret = pret;
	}
	
	public AlimenteUser() {
		super();
	}

	public int getId() {
		return id;
	}
	public int getId_user() {
		return id_user;
	}
	public int getId_aliment() {
		return id_aliment;
	}
	public int getCantitate() {
		return cantitate;
	}
	public int getId_unitate_de_masura() {
		return id_unitate_de_masura;
	}
	public String getUnitate_de_masura() {
		return unitate_de_masura;
	}
	public LocalDate getData_expirare() {
		return data_expirare;
	}
	public int getPret() {
		return pret;
	}
	public String getNume_aliment() {
		return nume_aliment;
	}

	public void setId(int id) {
		this.id = id;
	}

	public void setId_user(int id_user) {
		this.id_user = id_user;
	}

	public void setId_aliment(int id_aliment) {
		this.id_aliment = id_aliment;
	}

	public void setNume_aliment(String nume_aliment) {
		this.nume_aliment = nume_aliment;
	}

	public void setCantitate(int cantitate) {
		this.cantitate = cantitate;
	}

	public void setId_unitate_de_masura(int id_unitate_de_masura) {
		this.id_unitate_de_masura = id_unitate_de_masura;
	}

	public void setUnitate_de_masura(String unitate_de_masura) {
		this.unitate_de_masura = unitate_de_masura;
	}

	public void setData_expirare(LocalDate data_expirare) {
		this.data_expirare = data_expirare;
	}

	public void setPret(int pret) {
		this.pret = pret;
	}
	
	
}
