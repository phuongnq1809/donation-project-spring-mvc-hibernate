package phuongnq.prj321x.asm1.service;

import java.util.List;

import phuongnq.prj321x.asm1.entity.Role;

public interface RoleService {
	
	public Role getRole(int theId);

	public List<Role> getRoles();
}
