package ru.job4j.cinema.servlets;

import org.json.JSONObject;
import ru.job4j.cinema.model.Account;
import ru.job4j.cinema.model.Ticket;
import ru.job4j.cinema.store.PsqlStore;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Iterator;

public class PayServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws IOException {
        req.setCharacterEncoding("UTF-8");
        String email = req.getParameter("email");
        String username = req.getParameter("username");
        String phone = req.getParameter("phone");
        Account account = null;
        try {
            account = PsqlStore.instOf().findByIdAccount(phone, email);
            if (account == null) {
                account = PsqlStore.instOf().saveAccount(new Account(0,
                        username, email, phone));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        String places = req.getParameter("places");
        JSONObject objJSON = new JSONObject(places);
        HashMap<String, Object> res = new HashMap<>();
        Iterator itr = objJSON.keys();
        while (itr.hasNext()) {
            String key = itr.next().toString();
            res.put(key, objJSON.get(key));
        }
        for (Object rs : res.keySet()) {
            String[] rowCell = (rs.toString()).split("");
            int row = Integer.parseInt(rowCell[0]);
            int cell = Integer.parseInt(rowCell[1]);
            PsqlStore.instOf().saveTicket(new Ticket(
                    Integer.parseInt(rs.toString()),
                    1,
                    row,
                    cell,
                    account.getId()
            ));
        }
        resp.sendRedirect(req.getContextPath() + "/result.jsp");
    }
}
