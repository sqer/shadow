package pl.shadow.portal.service.uzytkownicy;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pl.shadow.portal.model.uzytkownicy.Uzytkownik;
import pl.shadow.portal.persistence.uzytkownicy.UzytkownicyMapper;
/**
 * 
 * klasa opisujaca akcje dla uzytkownicy
 * 
 */
@Service("defaultUzytkownicyService")
public class UzytkownicyServiceImpl implements UzytkownicyService {

	@Autowired
	private UzytkownicyMapper uzytkownicyMapper;

	/**
	 * pobieranie uzytkownikow
	 */
	@Override
	public List<Uzytkownik> getUzytkownicyList() {
		return uzytkownicyMapper.getUzytkownicy();
	}

	/**
	 * pobieranie uzytkownika wedlug id
	 */
	@Override
	public Uzytkownik getUzytkownikById(Integer id) {
		return uzytkownicyMapper.getUzytkownikById(id);
	}

	/**
	 * pobieranie uzytkownika wedlug nazwy
	 */
	@Override
	public Uzytkownik getUzytkownikByName(String name) {
		return uzytkownicyMapper.getUzytkownikByName(name);
	}

	/**
	 * zapis uzytkownika
	 */
	@Override
	public int persist(Object object) {
		return uzytkownicyMapper.persist((Uzytkownik) object);
	}

	/**
	 * aktualizacja uzytkownika
	 */
	@Override
	public int update(Object object) {
		return uzytkownicyMapper.update((Uzytkownik) object);
	}

	/**
	 * usuwanie uzytkownika
	 */
	@Override
	public int delete(Integer id) {
		return uzytkownicyMapper.delete(id);
	}
	
	/**
	 * zmiana hasla
	 */
	public int changePassword(Uzytkownik uzytkownik){
		return uzytkownicyMapper.changePassword(uzytkownik);
	}

}
