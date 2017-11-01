create table article
(
	id int auto_increment
		primary key,
	pid int null,
	rootid int null,
	title varchar(255) null,
	cont text null,
	pdate datetime null,
	isleaf int null
)
;