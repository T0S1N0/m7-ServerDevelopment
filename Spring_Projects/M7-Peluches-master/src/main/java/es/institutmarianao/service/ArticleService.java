/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package es.institutmarianao.service;

import es.institutmarianao.domain.Article;
import java.util.List;

/**
 *
 * @author mmartin
 */
public interface ArticleService {

    public List<Article> getAllArticles();

    public Article getArticleByReference(String reference);
}
