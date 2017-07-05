package br.edu.ifc.concordia.inf.permission;

public enum UserRoles {

	NORMAL(1),
	ADMIN(10),
	SYS_ADMIN(15);
	
	private int accessLevel;
	
	private UserRoles(int accessLevel){
		this.accessLevel = accessLevel;
	}
	
	public int getAccessLevel(){
		return this.accessLevel;
	}
}

