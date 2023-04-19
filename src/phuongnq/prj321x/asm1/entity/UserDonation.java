package phuongnq.prj321x.asm1.entity;

import java.text.DecimalFormat;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="user_donation")
public class UserDonation {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="id")
	private int id;
	
	@Column(name="created")
	private String created;
	
	@Column(name="money")
	private int money;
	
	@Column(name="name")
	private String name;
	
	@Column(name="status")
	private int status;
	
	@Column(name="text")
	private String text;
	
	@Column(name="user_id")
	private int userId;
	
	@Column(name="donation_id")
	private int donationId;
	
	public UserDonation() {
		
	}

	public UserDonation(String created, int money, String name, int status, String text, int userId, int donationId) {
		this.created = created;
		this.money = money;
		this.name = name;
		this.status = status;
		this.text = text;
		this.userId = userId;
		this.donationId = donationId;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getCreated() {
		return created;
	}

	public void setCreated(String created) {
		this.created = created;
	}

	public int getMoney() {
		return money;
	}

	public void setMoney(int money) {
		this.money = money;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getDonationId() {
		return donationId;
	}

	public void setDonationId(int donationId) {
		this.donationId = donationId;
	}
	
	public String getMoneyFormatted() {
		DecimalFormat formatter = new DecimalFormat("###,###,###");
		return formatter.format(getMoney());
	}
	
}
