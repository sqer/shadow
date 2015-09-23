package pl.shadow.portal.service;

/**
 * 
 * Interfejs pomocniczy opisujacy domysle akcje dla kontrolera
 * 
 */
public interface ShadowHelperService {

	public int persist(Object object);

	public int update(Object object);

	public int delete(Integer id);

}
