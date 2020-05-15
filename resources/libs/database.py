import psycopg2


def remove_product_by_title(title):

    query = "delete from public.products where title = '{}';".format(title)

    conn = psycopg2.connect(
        host='pgdb',
        database='ninjapixel',
        user='postgres',
        password='qaninja'
    )

    cur = conn.cursor()
    cur.execute(query)
    conn.commit()
    conn.close()
