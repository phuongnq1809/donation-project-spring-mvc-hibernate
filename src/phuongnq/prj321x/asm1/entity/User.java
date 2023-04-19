package phuongnq.prj321x.asm1.entity;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

@Entity
@Table(name="user")
public class User {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="id")
	private int id;
	
	@NotNull(message="is required")
	@Column(name="address")
	private String address;
	
	@NotNull(message="is required")
	@Email(regexp = ".+[@].+[\\\\.].+", message="must be valid email")
	@Column(name="email")
	private String email;
	
	@NotNull(message="is required")
	@Column(name="full_name")
	private String fullName;
	
	@Column(name="note")
	private String note;
	
	@NotNull(message="is required")
	@Column(name="user_name")
	private String username;
	
	@NotNull(message="is required")
	@Column(name="password")
	private String password;
	
	@NotNull(message="is required")
	@Pattern(regexp = "^[0-9]{10}", message = "must be valid phone number")
	@Column(name="phone_number")
	private String phoneNumber;
	
	@Column(name="status")
	private int status;
	
	@Column(name="created")
	private String created;
	
	@OneToOne(cascade = {CascadeType.DETACH, CascadeType.MERGE, CascadeType.PERSIST, CascadeType.REFRESH})
	@JoinColumn(name="role_id")
	private Role role;
	
	public User() {
		
	}

	public User(String address, String email, String fullName, String note, String username, String password,
			String phoneNumber, int status, String created, Role role) {
		this.address = address;
		this.email = email;
		this.fullName = fullName;
		this.note = note;
		this.username = username;
		this.password = password;
		this.phoneNumber = phoneNumber;
		this.status = status;
		this.created = created;
		this.role = role;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getCreated() {
		return created;
	}

	public void setCreated(String created) {
		this.created = created;
	}

	public Role getRole() {
		return role;
	}

	public void setRole(Role role) {
		this.role = role;
	}
	
}
