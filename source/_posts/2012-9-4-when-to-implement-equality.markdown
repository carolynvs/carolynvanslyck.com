---
layout: post
title: "When should I implement GetHashCode, Equals, IEquatable and IComparable?"
date: 2012-9-4
comments: true
categories: 
---
<ul style="list-style-type: none">
    <li><strong>GetHashCode and Equals</strong>
        <p>I am implementing another equality or comparison interface, I want LINQ set operations to work (e.g. Union, Intersect, Except)
            or will be using Object.Equals. When I implement anything equality related, this is the first task. I always override GetHashCode
            and Equals together, never just one or the other.</p></li>
    <li><strong>Equality Operators</strong>
        <p>I am using the equals (==) or not equals (!=) operators on my objects and I want to compare equality, not references.</p>
    </li>
    <li><strong>IEquatable&lt;T&gt;</strong>
        <p>I am using my object in a List&lt;T&gt; or Dictionary&lt;T&gt; so that Contains, IndexOf, Remove, etc works.</p>
    </li>
    <li><strong>IComparable</strong>
        <p>I need to sort my objects, either manually or via List.Sort or LINQ's OrderBy. I prefer to implement the generic IComparable&lt;T&gt;
            interface over plain old IComparable.</p>
    </li>
</ul>