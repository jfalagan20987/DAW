(: for $obra in //obra
return $obra :)

(: for $obra in //obra
where $obra/@any > "1800"
order by $obra/@any descending
return $obra :)

(: for $obra in //obra
where $obra/@any > "1800"
order by $obra/@pais
return $obra/titol/string() :)

(: for $obra in //obra
let $visible:= $obra/museu/@visible
where $visible = "true"
return data($obra/@pais) :)

(: distinct-values(
  for $obra in //obra
  let $visible:= $obra/museu/@visible
  where $visible = "true"
  return substring(data($obra/@pais), 2)
) :)

(: for $pais in distinct-values(
  for $obra in //obra
  let $visible:= $obra/museu/@visible
  where $visible = "true"
  order by $obra/@pais
  return data($obra/@pais)
)
order by $pais
return $pais :)

(: <ul>
{
  for $pais in distinct-values(
    for $obra in //obra
    let $visible:= $obra/museu/@visible
    where $visible = "true"
    order by $obra/@pais
    return data($obra/@pais)
  )
  order by $pais
  return <li>{$pais}</li> 
}
</ul> :)

(: <ul>
{
  distinct-values(
    for $obra in //obra
    let $visible:= $obra/museu/@visible
    where $visible = "true"
    order by $obra/@pais
    return <li>{data($obra/@pais)}</li>
  )
}
</ul> :)

(: <table>
{
  for $obra in //obra
  order by $obra/autor
  return if($obra/@pais="França")
  then
    <tr>
      <td>{$obra/titol/text()}</td>
      <td>{$obra/autor/text()}</td>
    </tr>
  else ()
}
</table> :)

(: for $obra in //obra
order by $obra/autor
return
  concat(
    "Títol: ", $obra/titol/text(),
    " - Autor: ", $obra/autor/text()
  ) :)
  
(: for $obra in //obra
let $titol:= concat("Títol: ", $obra/titol/text())
order by $obra/autor
return
  concat(
    $titol,
    " - Autor: ", $obra/autor/text()
  ) :)
  
<ul>
{
  for $obra in //obra
  let $visible:= $obra/museu/@visible
  return
    <li>
    {
      concat($obra/titol,
        " (", $obra/@any, ") - ",
        if($visible = "ture") then
          concat("Exposat al ", $obra/museu)
        else "No exposat al museu")
    }
    </li>
}
</ul>

