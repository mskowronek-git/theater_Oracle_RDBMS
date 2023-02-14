CREATE SEQUENCE rk_id_seq
INCREMENT BY 1
START WITH 39
MAXVALUE 200
NOCACHE
NOCYCLE;

INSERT INTO rekwizyty VALUES (rk_id_seq.NEXTVAL, 'pistolet', 0.86, 1);
INSERT INTO rekwizyty VALUES (rk_id_seq.NEXTVAL, 'miecz', 1.3, 1);
INSERT INTO rekwizyty VALUES (rk_id_seq.NEXTVAL, 'zolty plaszcz', 0.35, 0);
INSERT INTO rekwizyty VALUES (rk_id_seq.NEXTVAL, 'krokodyl', 523.5, 1);
INSERT INTO rekwizyty VALUES (rk_id_seq.NEXTVAL, 'rower', 12.5, 0);



CREATE SEQUENCE sc_id_seq
INCREMENT BY 1
START WITH 6
MAXVALUE 50
NOCACHE
NOCYCLE;

INSERT INTO scenariusze VALUES (sc_id_seq.NEXTVAL, 40, to_date('19/06/24', 'yy/mm/dd'), NULL);
INSERT INTO scenariusze VALUES (sc_id_seq.NEXTVAL, 520, to_date('19/02/03', 'yy/mm/dd'), NULL);
INSERT INTO scenariusze VALUES (sc_id_seq.NEXTVAL, 134, to_date('20/01/10', 'yy/mm/dd'), NULL);
INSERT INTO scenariusze VALUES (sc_id_seq.NEXTVAL, 83, to_date('20/12/05', 'yy/mm/dd'), NULL);



CREATE SEQUENCE rl_id_seq
INCREMENT BY 1
START WITH 213
MAXVALUE 300
NOCACHE
NOCYCLE;

INSERT INTO role (rl_id, nazwa, typ, sztuki_sz_id) VALUES (rl_id_seq.NEXTVAL, 'Chochol', 'dramatyczny', 101);
INSERT INTO role (rl_id, nazwa, typ, sztuki_sz_id) VALUES (rl_id_seq.NEXTVAL, 'Dziennikarz', 'dramatyczny', 101);
INSERT INTO role (rl_id, nazwa, typ, sztuki_sz_id) VALUES (rl_id_seq.NEXTVAL, 'Pani Solska', 'komediowy', 102);
INSERT INTO role (rl_id, nazwa, typ, sztuki_sz_id) VALUES (rl_id_seq.NEXTVAL, 'Kaczka obrazalska', 'bajkowy', 103);
INSERT INTO role (rl_id, nazwa, typ, sztuki_sz_id) VALUES (rl_id_seq.NEXTVAL, 'Naczelnik', 'komediowy', 102);
