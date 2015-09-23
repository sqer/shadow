package pl.shadow.portal.utils;


import java.sql.SQLException;
import java.util.Map;

import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;

import org.springframework.jdbc.datasource.DriverManagerDataSource;

/**
 * 
 * Klasa umozliwiajaca tworzenie raportu pdf
 * 
 */
public class Report {

	public static void printReport(String reportName, String pdfName,
			Map<String, Object> parameterMap, DriverManagerDataSource conn)
			throws JRException, SQLException {
		JasperReport jasperReport;
		JasperPrint jasperPrint;
		jasperReport = JasperCompileManager.compileReport("reports/"
				+ reportName);

		jasperPrint = JasperFillManager.fillReport(jasperReport, parameterMap,
				conn.getConnection());

		String filePath = "src/main/webapp/views/pdf/" + pdfName + ".pdf";

		JasperExportManager.exportReportToPdfFile(jasperPrint, filePath);

	}
}

