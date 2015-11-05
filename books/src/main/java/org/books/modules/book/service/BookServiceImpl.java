/*
 * Copyright 2012-2013 the original author or authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package org.books.modules.book.service;

import org.books.modules.book.dao.BookRepository;
import org.books.modules.book.dao.BookSearchCriteria;
import org.books.modules.book.entity.Book;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

@Component("bookService")
@Transactional
class BookServiceImpl implements BookService {

	@Autowired
	private BookRepository bookRepository;

	@Override
	public Page<Book> find(Pageable pageable) {
		return bookRepository.findAll(pageable);
	}

	/* (non-Javadoc)
	 * @see org.books.modules.book.service.BookService#save(org.books.modules.book.entity.Book)
	 */
	@Override
	public Book save(Book book) {
		return bookRepository.save(book);
	}

}
