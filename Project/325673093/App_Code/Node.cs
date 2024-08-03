using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Node
/// </summary>
public class Node<T>
{
    private T x;
    private Node<T> next;

    public Node(T x)
    {
        this.x = x;
        this.next = null;
    }
    public Node(T x, Node<T> next)
    {
        this.next = next;
        this.x = x;
    }
    public T GetValue()
    {
        return x;
    }
    public Node<T> GetNext()
    {
        return next;
    }
    public bool HasNext()
    {
        if (next != null)
            return true;
        return false;
    }
    public void SetValue(T x)
    {
        this.x = x;
    }
    public void SetNext(Node<T> next)
    {
        this.next = next;
    }
    public override string ToString()
    {
        if (next != null)
            return "value:" + x + " next->" + next.ToString();
        return "value:" + x + " and thats the last node";
    }
}
