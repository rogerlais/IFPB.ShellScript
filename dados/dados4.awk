function get_loginName( nameParts ){
    print "Partes dos campos abaixo: ***";
    for (i in nameParts) print nameParts[i];
    result=nameParts[1];
    for (i=2; i<=length(nameParts); i++) {
        result=result substr(nameParts[i],1,1);
    }
    print "login = " result;
    return result;
}

{
    if ( NR % 5 == 1 ){
        print "linha" NR " Campos: " NF;
        for ( fields=1; fields <= NF; fields++ ){
            parts[ fields ] = $fields;            
        }        
        logins[$0] = get_loginName( parts );
    }    
}
END{
    print "Name                                 login Name";
    print "----                                     ------";
	for( fullName in logins ){
        printf "%-40s %s\n", fullName, logins[fullName];
	}
}
