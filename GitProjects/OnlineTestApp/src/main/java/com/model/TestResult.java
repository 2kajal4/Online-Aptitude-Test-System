package com.model;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="test_result")
public class TestResult {

    @Id
    private int id;

    private String username;
    private String q1;
    private String q2;
    private String q3;
    private String q4;
    private String q5;

    private int score;
    private int percentage;
    private String discount;

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getUsername() { return username; }
    public void setUsername(String username) { this.username = username; }

    public String getQ1() { return q1; }
    public void setQ1(String q1) { this.q1 = q1; }

    public String getQ2() { return q2; }
    public void setQ2(String q2) { this.q2 = q2; }

    public String getQ3() { return q3; }
    public void setQ3(String q3) { this.q3 = q3; }

    public String getQ4() { return q4; }
    public void setQ4(String q4) { this.q4 = q4; }

    public String getQ5() { return q5; }
    public void setQ5(String q5) { this.q5 = q5; }

    public int getScore() { return score; }
    public void setScore(int score) { this.score = score; }

    public int getPercentage() { return percentage; }
    public void setPercentage(int percentage) { this.percentage = percentage; }

    public String getDiscount() { return discount; }
    public void setDiscount(String discount) { this.discount = discount; }
}


