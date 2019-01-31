package nl.avans.ui;

import java.awt.event.*;
import javax.swing.*;
import java.awt.*;
import javax.swing.border.*;
import com.intellij.uiDesigner.core.*;
import javax.swing.JFrame;

public class Login extends JFrame {
    //the mainframe creates all the components and controls them.

    private UIComponents footer;
    private LoginScreenUI LoginScreenPane;
    private JFrame frame;

    //Hier wordt de UI in elkaar gezet met compontenten in een andere class.
    public Login() {

        frame = new JFrame("Welcome to Netflix");
        LoginScreenPane = new LoginScreenUI();
        footer = new UIComponents();

        frame.add(footer.createFooter(), BorderLayout.SOUTH);
        frame.add(LoginScreenPane.LoginLabel(), BorderLayout.NORTH);
        frame.add(LoginScreenPane.createdialogPane());
        frame.add(LoginScreenPane.createcontentPanel(), BorderLayout.CENTER);

        frame.add(LoginScreenPane.createButtonBar(), BorderLayout.SOUTH);

        frame.setSize(900, 600);
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.setVisible(true);
        frame.setLayout(new BorderLayout());


    }
}