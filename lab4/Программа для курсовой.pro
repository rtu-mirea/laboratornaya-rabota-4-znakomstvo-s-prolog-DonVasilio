predicates
	nondeterm standOnRaid(symbol,symbol)
	nondeterm have(symbol,symbol)
	nondeterm raisedTo(symbol,symbol)
	nondeterm deliveredOn(symbol,symbol)
	nondeterm situateOn(symbol,symbol)
	nondeterm accompany(symbol,symbol)
	nondeterm carryOnshoulder(symbol,symbol)
	nondeterm returnOn(symbol,symbol)
	nondeterm mooredTo(symbol,symbol)
	nondeterm know(symbol,symbol)
	nondeterm ask(symbol,symbol)
	nondeterm to(symbol,symbol)
	nondeterm yellow(symbol)
	nondeterm spanish(symbol)
	nondeterm placed(symbol,symbol)
	nondeterm called(symbol,symbol)
clauses
	yellow(galeon).
	
	spanish(flag).
	
	placed(port, puertoRico).
	placed(dock, puertoRico).
	
	called(port, santiago).
	
	have(galleon,flag).
	have(galleon,topOfMainmast).
	have(port,dock).
	have(galleon,boat).
	have(stranger,bag).
	have(galleon,board).
	have(governor,house).
	
	raisedTo(flag,topOfMainmast).
	
	situateOn(stranger,galleon).
	situateOn(servant,port).
	situateOn(stranger,dock) :- 
		deliveredOn(stranger,dock).
	situateOn(boat,dock) :- 
		deliveredOn(stranger,dock).
	situateOn(stranger,port) :- 
		situateOn(stranger,dock), 
		have(port,dock), 
		situateOn(servant,port), 
		accompany(servant,stranger), 
		carryOnShoulder(servant,bag), 
		have(stranger,bag), 
		placed(port, puertoRico), 
		called(port, santiago).
	
	accompany(servant,stranger).
	
	carryOnShoulder(servant,bag).
	
	ask(stranger,commander).
	
	to(way,house).
	
	know(commander,way).
	know(stranger,way) :- 
		know(commander,way),
		situateOn(stranger,port), 
		ask(stranger,commander), 
		to(way,house), 
		have(governor,house).
	
	standOnRaid(galleon,port) :- 
		have(galleon,flag), 
		have(galleon,topOfMainmast),
		raisedTo(flag,topOfMainmast),
		yellow(galeon), 
		spanish(flag), 
		placed(port, puertoRico), 
		called(port, santiago).
		
	deliveredOn(stranger,dock) :- 
		standOnRaid(galleon,port), 
		have(galleon,boat),
		situateOn(stranger,galleon),  
		have(port,dock), 
		placed(dock, puertoRico).
		
	returnOn(boat,galleon) :-  
		situateOn(stranger,dock), 
		situateOn(boat,dock).
	
	mooredTo(boat,board) :- 
		returnOn(boat,galleon), 
		have(galleon,board).
		
goal
	standOnRaid(galleon,port), 
	deliveredOn(X, Y), 
	situateOn(X, Y),
	situateOn(Z, Y),
	situateOn(X, port),
	returnOn(Z, galleon),
	mooredTo(Z, board),
	know(X, way).
