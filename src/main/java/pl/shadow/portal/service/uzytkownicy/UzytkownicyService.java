package pl.shadow.portal.service.uzytkownicy;

import java.util.List;

import pl.shadow.portal.model.uzytkownicy.Uzytkownik;
import pl.shadow.portal.service.ShadowHelperService;

/**
 * 
 * interfejs definujacy akcje dla uzytkownicy
 * 
 */
public interface UzytkownicyService extends ShadowHelperService {

	public List<Uzytkownik> getUzytkownicyList();

	public Uzytkownik getUzytkownikById(Integer id);

	public Uzytkownik getUzytkownikByName(String name);

	public int changePassword(Uzytkownik uzytkownik);
}
