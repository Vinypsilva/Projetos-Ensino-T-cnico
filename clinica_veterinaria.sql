create table `animals`(
	`ID`int(11) NOT NULL,
    `name` varchar(100) DEFAULT NULL,
    `escape_attempts` int(11) DEFAULT NULL,
    `neutered` bit(1) DEFAULT NULL,
    `weight_kg` decimal(10,0) DEFAULT NULL,
    `species_id`  int(11) DEFAULT NULL,
    `owner_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

create table `owners`(
	`ID` int(11) NOT NULL,
    `full_name` varchar(100) DEFAULT NULL,
    `age` int(11) DEFAULT NULL
    )	ENGINE=InnoDB DEFAULT CHARSET=utf8;
    
create table `especializations`(
	`vets_id` int(11) NOT NULL,
    `species_id` int(11) NOT NULL 	
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8;	
    
create table `species`(
	`ID` int(11) NOT NULL,
    `Name` varchar(100) DEFAULT NULL
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8;

create table `vets`(
	`ID` int(11) NOT NULL,
	`name` varchar(100) DEFAULT NULL,
    `age` int(11) DEFAULT NULL
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
    DROP TABLE `vets`;
    ALTER TABLE `vets`
    ADD UNIQUE (`ID`);
create table `visit` (
	`vets_id` int(11) NOT NULL,
    `animals_id` int(11) NOT NULL
    ) ENGINE = InnoDB DEFAULT CHARSET=utf8;
    
alter table `animals`
	add primary key (`ID`),
    add key `fk_species` (`species_id`),
    add key `fk_owners` (`owner_id`);
    
 alter table `owners`
	add primary key (`ID`);
    
alter table `especializations`
	add key `vets_id`(`vets_id`),
    add key `species_id` (`species_id`);
    
alter table `species`
	add primary key (`ID`);
    
alter table `visit`
	add key `animals_id_asc` (`animals_id`),
    add key `vet_id_asc` (`vets_id`);
    
alter table `animals`
	modify `id` int(11) not null auto_increment;
    
alter table `species`
	modify `id` int(11) not null auto_increment;

ALTER TABLE `vets`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

alter table `animals`
  add constraint `fk_owners` FOREIGN KEY (`owner_id`) REFERENCES `owners` (`ID`),
  add constraint `fk_species` FOREIGN KEY(`species_id`) REFERENCES `species`(`ID`);
    
alter table `especializations`
     add constraint `specializations_ibfk_1` FOREIGN KEY (`vets_id`) REFERENCES `vets` (`ID`) ON UPDATE CASCADE,
     add constraint `specializations_ibfk_2` FOREIGN KEY (`vets_id`) REFERENCES `vets` (`ID`) ON UPDATE CASCADE;
    
alter table `visit`
	add constraint `visits_ibfk_1` FOREIGN KEY (`vets_id`) REFERENCES `vets` (`id`) on update cascade,
    ADD CONSTRAINT `vistis_ibfk_2` FOREIGN KEY (`animals_id`) REFERENCES `animals` (`ID`) ON UPDATE CASCADE;

  
COMMIT;
    
    
    


