package com.cave.dao;

import java.util.List;

import com.cave.beans.Blog;

public interface BlogDao {

    List<Blog> lister() throws DAOException;

}
