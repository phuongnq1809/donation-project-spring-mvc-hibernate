package phuongnq.prj321x.asm1.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import phuongnq.prj321x.asm1.dao.RoleDAO;
import phuongnq.prj321x.asm1.entity.Role;

@Service
public class RoleServiceImpl implements RoleService {
	
	@Autowired
	private RoleDAO roleDAO;
	
	@Override
	@Transactional
	public Role getRole(int theId) {
		return roleDAO.getRole(theId);
	}

	@Override
	@Transactional
	public List<Role> getRoles() {
		return roleDAO.getRoles();
	}

}
