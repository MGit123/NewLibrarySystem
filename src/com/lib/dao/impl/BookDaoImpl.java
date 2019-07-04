package com.lib.dao.impl;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import com.lib.dao.BookDao;
import com.lib.entity.Book;

//ע��
@Repository
public class BookDaoImpl implements BookDao {

	public BookDaoImpl() {
		// TODO Auto-generated constructor stub
	}
    
	//ע��applicationContext.xml�����úõ�sessionFactory
	@Resource(name="sessionFactory")
	private SessionFactory sessionFactory;
	
	@Override
	public List<Book> ListBook(int pageNum) {
		// TODO Auto-generated method stub
		int pageSize=5;        //�б�5��
		int page=(pageNum-1)*5; //��n-1ҳ
		
		String hql="from Book order by bookNum";
		Query query=sessionFactory.getCurrentSession().createQuery(hql);
		query.setFirstResult(page);
		query.setMaxResults(pageSize);
		return query.list();
	}

	@Override
	public List<Book> ListBook(int pageNum, int selectType, String val) {
		// TODO Auto-generated method stub
		int pageSize=5;        //�б�5��
		int page=(pageNum-1)*5; //��n-1ҳ
		String hql="";
		
		if(selectType==1){
			hql="from Book where bookNum=? order by bookNum";
		}
		else if(selectType==2){
			hql="from Book where author=? order by bookNum";
		}else{
			hql="from Book where bookType=? order by bookNum";
		}
		
		Query query=sessionFactory.getCurrentSession().createQuery(hql);
		query.setString(0, val);
		query.setFirstResult(page);
		query.setMaxResults(pageSize);
		return query.list();
	}

	@Override
	public int getPage() {
		// TODO Auto-generated method stub
		int recordCount=0;        
	    int t1=0;   //����
	    int t2=0;   //ҳ��
	    
	    String hql="from Book";
		Query query=sessionFactory.getCurrentSession().createQuery(hql);
		recordCount=query.list().size();
		System.out.println("��ѯ��:"+recordCount+"����¼!");
		t1=recordCount%5;
		t2=recordCount/5;  
		
		if(t1 != 0){
			t2=t2+1;
			}
		return t2;
	}

	@Override
	public int getPage(int selectType, String val) {
		// TODO Auto-generated method stub
		int recordCount=0;        
	    int t1=0;   //����
	    int t2=0;   //��5������
	    String  hql="";
	    
	    if(selectType==1){
			hql="from Book where bookNum=?";
		}
		else if(selectType==2){
			hql="from Book where author=?";
		}else{
			hql="from Book where bookType=?";
		}
	    
	    Query query=sessionFactory.getCurrentSession().createQuery(hql);
		query.setString(0, val);
		recordCount=query.list().size();
		System.out.println("��ѯ��:"+recordCount+"����¼!");
		t1=recordCount%5;
		t2=recordCount/5;  
		
		if(t1 != 0){
			t2=t2+1;
			}
		
		return t2;
	}

	@Override
	public Book findBookByNum(int bookNum) {
		// TODO Auto-generated method stub
		String hql="from Book where bookNum=?";
		Query query=sessionFactory.getCurrentSession().createQuery(hql);
		query.setInteger(0, bookNum);
		return (Book) query.list().get(0);
	}

	@Override
	public boolean addBook(Book book) {
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().save(book);
		System.out.println(book.getBookName()+" "+book.getBookNum());
		System.out.println("ͼ�����ɹ�!");
		 return true;
	}

	@Override
	public boolean updateBook(Book book) {
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().update(book);
		System.out.println(book.getBookName()+" "+book.getBookNum());
		System.out.println("ͼ����Ϣ�޸ĳɹ�!");
		 return true;
	}

}
