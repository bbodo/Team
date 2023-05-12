package com.green.market.vo;

public class TransactionVo {
	
	// Field
	private int    transaction_idx;
	private int    transaction_su;
	private int    usercode;
	private int    board_idx;
	private String transaction_date;
	private int    deltransaction;

	// Constructor
	public TransactionVo() {}
	public TransactionVo(int transaction_idx, int transaction_su, int usercode, int board_idx, String transaction_date,
			int deltransaction) {
		this.transaction_idx = transaction_idx;
		this.transaction_su = transaction_su;
		this.usercode = usercode;
		this.board_idx = board_idx;
		this.transaction_date = transaction_date;
		this.deltransaction = deltransaction;
	}
	
	// Getter / Setter
	public int getTransaction_idx() {
		return transaction_idx;
	}
	public void setTransaction_idx(int transaction_idx) {
		this.transaction_idx = transaction_idx;
	}
	public int getTransaction_su() {
		return transaction_su;
	}
	public void setTransaction_su(int transaction_su) {
		this.transaction_su = transaction_su;
	}
	public int getUsercode() {
		return usercode;
	}
	public void setUsercode(int usercode) {
		this.usercode = usercode;
	}
	public int getBoard_idx() {
		return board_idx;
	}
	public void setBoard_idx(int board_idx) {
		this.board_idx = board_idx;
	}
	public String getTransaction_date() {
		return transaction_date;
	}
	public void setTransaction_date(String transaction_date) {
		this.transaction_date = transaction_date;
	}
	public int getDeltransaction() {
		return deltransaction;
	}
	public void setDeltransaction(int deltransaction) {
		this.deltransaction = deltransaction;
	}
	
	// toString
	@Override
	public String toString() {
		return "TransactionVo [transaction_idx=" + transaction_idx + ", transaction_su=" + transaction_su + ", usercode="
				+ usercode + ", board_idx=" + board_idx + ", transaction_date=" + transaction_date + ", deltransaction="
				+ deltransaction + "]";
	}
	
}
