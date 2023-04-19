package phuongnq.prj321x.asm1.dao;

import java.util.List;

import phuongnq.prj321x.asm1.entity.Role;

public interface RoleDAO {
	
	public Role getRole(int theId);

	public List<Role> getRoles();
}
