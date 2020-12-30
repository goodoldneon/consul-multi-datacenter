import requests
import tornado.ioloop
import tornado.web

from const import CONSUL_DATACENTER, INSTANCE_NUM, SERVICE_NAME


class MainHandler(tornado.web.RequestHandler):
    def get(self):
        self.write(
            {
                "service_name": SERVICE_NAME,
                "instance_num": INSTANCE_NUM,
                "consul_datacenter": CONSUL_DATACENTER,
            }
        )


def make_app():
    return tornado.web.Application([(r"/", MainHandler)])


if __name__ == "__main__":
    app = make_app()
    app.listen(80)
    tornado.ioloop.IOLoop.current().start()
