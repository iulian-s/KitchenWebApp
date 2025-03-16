package com.exemplu.dao;

public class ContinutReteta {
    private int idAliment;
    private int cantitate;
    private int idUnitateMasura;

    public ContinutReteta(int idAliment, int cantitate, int idUnitateMasura) {
        this.idAliment = idAliment;
        this.cantitate = cantitate;
        this.idUnitateMasura = idUnitateMasura;
    }

	public int getIdAliment() {
		return idAliment;
	}

	public int getCantitate() {
		return cantitate;
	}

	public int getIdUnitateMasura() {
		return idUnitateMasura;
	}

    
}