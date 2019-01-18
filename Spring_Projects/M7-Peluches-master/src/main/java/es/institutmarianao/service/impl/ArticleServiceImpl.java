/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package es.institutmarianao.service.impl;

import es.institutmarianao.domain.Article;
import es.institutmarianao.domain.repository.ArticleRepository;
import es.institutmarianao.service.ArticleService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author mmartin
 */
@Service
public class ArticleServiceImpl implements ArticleService {

    @Autowired
    private ArticleRepository articleRepository;

    public List<Article> getAllArticles() {
        return articleRepository.getAllArticles();
    }

    public Article getArticleByReference(String reference) {
        return articleRepository.getArticleByReference(reference);
    }

}
