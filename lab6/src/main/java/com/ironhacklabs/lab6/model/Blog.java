package com.ironhacklabs.lab6.model;

import jakarta.persistence.*;
@Entity
public class Blog {
    @Id
    private String title;
    private Integer word_count;
    private Integer views;
    @ManyToOne
    @JoinColumn(name = "author_author_id")
    private Author author;
    public Blog() {
    }
    public Blog(String title, Integer word_count, Integer views, Author author) {
        this.title = title;
        this.word_count = word_count;
        this.views = views;
        this.author = author;
    }
    public String getTitle() {
        return title;
    }
    public void setTitle(String title) {
        this.title = title;
    }
    public Integer getWord_count() {
        return word_count;
    }
    public void setWord_count(Integer word_count) {
        this.word_count = word_count;
    }
    public Integer getViews() {
        return views;
    }
    public void setViews(Integer views) {
        this.views = views;
    }
    public Author getAuthor() {
        return author;
    }
    public void setAuthor(Author author) {
        this.author = author;
    }
    @Override
    public String toString() {
        return "Blog{" +
                "title='" + title + '\'' +
                ", word_count=" + word_count +
                ", views=" + views +
                ", author=" + author +
                '}';
    }
}