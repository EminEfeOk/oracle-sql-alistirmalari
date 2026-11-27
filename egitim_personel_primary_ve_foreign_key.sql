alter table departman add constraint pk_dept_id primary key (dept_id);

-- departmandaki dept id personeldeki dept idye etkileyecek orada olmayan idler personelde olamaz 
alter table personel add constraint fk_dept  foreign key (dept_id) references departman(dept_id);

-- personel tablosundan bulunan konum_id kolonu konum tablosundan gelecek sekilde ekleme
alter table konum add constraint pk_konum_id primary key (konum_id);

alter table personel add constraint fk_konum_id foreign key (konum_id) references konum(konum_id);
