package pl.shadow.portal.persistence.uzytkownicy;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import pl.shadow.portal.model.uzytkownicy.Uzytkownik;
import pl.shadow.portal.persistence.HelperMapper;

/**
 * 
 * Interfejs odzwierciedlajacy zapytania wysylane do bazy danych opisane w pliku
 * xml dla tabeli uzytkownicy
 * 
 */
public interface UzytkownicyMapper extends HelperMapper {

	public List<Uzytkownik> getUzytkownicy();

	public Uzytkownik getUzytkownikById(@Param("id") Integer id);

	public Uzytkownik getUzytkownikByName(@Param("name") String name);

	public int persist(Uzytkownik uzytkownik);

	public int update(Uzytkownik uzytkownik);

	public int changePassword(Uzytkownik uzytkownik);

	public int delete(Integer id);

}
